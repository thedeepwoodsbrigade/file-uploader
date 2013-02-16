class @FileUploader
  constructor: (@dropAreaSelector, @resultAreaSelector, @ajaxUrl) ->
    dropArea = document.querySelectorAll(@dropAreaSelector)[0]

    dropArea.addEventListener 'dragenter', @noop,      false
    dropArea.addEventListener 'dragexit',  @noop,      false
    dropArea.addEventListener 'dragover',  @noop,      false
    dropArea.addEventListener 'drop',      @dropFiles, false

    selectArea = document.getElementById('file-input')
    selectArea.addEventListener 'change', @selectFiles, false

  noop: (event) =>
    event.stopPropagation()
    event.preventDefault()

  dropFiles: (event) =>
    event.stopPropagation()
    event.preventDefault()
    @noop event
    @uploadFiles event.dataTransfer.files

  selectFiles: =>
    select = document.getElementById('file-input')
    @uploadFiles select.files

  uploadFiles: (files) =>
    @uploadFile file for file in files

  uploadFile: (file) =>
    data = new FormData()
    data.append 'asset[image]', file

    ajaxHash = 
      url: @ajaxUrl
      type: 'POST'
      data: data
      cache: false
      contentType: false
      processData: false
      success: (response) =>
        $(@resultAreaSelector).append response
    $.ajax ajaxHash, 'json'
