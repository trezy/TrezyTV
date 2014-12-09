define [
  'marionette'
], (
  Marionette
) ->
  Marionette.Region.prototype.show = (view, options) ->
    @_ensureElement()

    showOptions = options or {}
    isDifferentView = view isnt @currentView
    preventDestroy = !!showOptions.preventDestroy
    forceShow = !!showOptions.forceShow
    replaceElement = !!showOptions.replaceElement

    isChangingView = !!@currentView
    _shouldDestroyView = isDifferentView and not preventDestroy
    _shouldShowView = isDifferentView or forceShow
    _shouldReplaceElement = replaceElement

    if isChangingView
      @triggerMethod 'before:swapOut', @currentView

    if _shouldDestroyView
      @empty()

    if _shouldShowView
      view.once 'destroy', @empty, @
      view.render()

      if isChangingView
        @triggerMethod 'before:swap', view

      @triggerMethod 'before:show', view
      Marionette.triggerMethodOn view, 'before:show'

      @attachHtml view, _shouldReplaceElement

      if isChangingView
        @triggerMethod 'swapOut', @currentView

      @currentView = view

      if isChangingView
        triggerMethod 'swap', view

      @triggerMethod 'show', view
      Marionette.triggerMethodOn view, 'show'

      return this

    return this

  Marionette.Region.prototype.replaceEl = (view) ->
    parent = @el.parentNode
    parent.replaceChild view.el, @el
    @replaced = true

  Marionette.Region.prototype.restoreEl = ->
    view = @currentView
    parent = @el.parentNode
    parent.replaceChild @el, view.el
    @replaced = false

  Marionette.Region.prototype.attachHtml = (view) ->
    if arguments[1]
      @replaceEl view
    else
      @el.innerHTML = ''
      @el.appendChild view.el

  Marionette.Region.prototype.empty = ->
    view = @currentView

    unless view
      return

    @triggerMethod 'before:empty', view

    @restoreEl() if @replaced

    @_destroyView()
    @triggerMethod 'empty', view

    delete @currentView
    this
