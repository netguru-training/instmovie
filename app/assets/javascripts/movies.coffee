$ ->
  $("#js-tag-selector").select2
    id: (e) ->
      e.id
    placeholder: "Movie tags"
    ajax:
      url: '/tags/ajax_get_list'
      dataType: 'json'
      delay: 250
      data: (params) ->
        {
          q: params.term,
          page: params.page
        }
      processResults: (data, page) ->
        results = []
        $.each data, (index, item) ->
          results.push
            id: item.id
            text: item.name
        debugger
        return { results: results }
    cache: true
