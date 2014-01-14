class Reader.Views.Feed extends Backbone.View

  template: JST['feeds/index']

  initialize: ->
    @listenTo @model, "destroy", @remove

  events:
    "click .btn-danger": "delete_feed"
    "click div:first-child": "show_entries"

  show_entries: ->
    entries = new Reader.Collections.Entries
    entries.url = "/feeds/#{@model.get("id")}/entries"
    @entriesView = new Reader.Views.Entries({collection: entries, feed: @model})
    $(".entries").append(@entriesView.render().el)

  delete_feed: ->
    @model.destroy()

  render: ->
    @$el.html @template(feed: @model)
    @
