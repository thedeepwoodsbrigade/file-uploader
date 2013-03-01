class @FileUploader
  constructor: (@fileUploadSelector, @ajaxUrl, @options={}) ->
    @uniqueId = 'file-upload-' + document.querySelectorAll(@fileUploadSelector).length
    fileUpload = document.querySelector @fileUploadSelector
    if !fileUpload.classList.contains('file-uploader')
      fileUpload.classList.add 'file-uploader'
    fileUpload.setAttribute 'id', @uniqueId

    dropArea = document.createElement 'div'
    dropArea.setAttribute 'class', 'drop-area'
    dropArea.addEventListener 'dragenter', @noop,      false
    dropArea.addEventListener 'dragexit',  @noop,      false
    dropArea.addEventListener 'dragover',  @noop,      false
    dropArea.addEventListener 'drop',      @dropFiles, false
    dropArea.innerHTML = 'Drop your files here'

    selectArea = document.createElement 'input'
    selectArea.setAttribute 'type', 'file'
    selectArea.setAttribute 'class', 'select-area'
    selectArea.addEventListener 'change', @selectFiles, false
    
    resultArea = document.createElement 'div'
    resultArea.setAttribute 'class', 'result-area'

    fileUpload.appendChild dropArea
    fileUpload.appendChild selectArea
    fileUpload.appendChild resultArea

    if fileUpload.hasAttribute('data-file-uploader-form-name')
      @formName = fileUpload.getAttribute('data-file-uploader-form-name')
    if fileUpload.hasAttribute('data-file-uploader-content')
      resultArea.innerHTML = fileUpload.getAttribute('data-file-uploader-content')
      fileUpload.removeAttribute('data-file-uploader-content')

  noop: (event) =>
    event.stopPropagation()
    event.preventDefault()

  dropFiles: (event) =>
    event.stopPropagation()
    event.preventDefault()
    @noop event
    @uploadFiles event.dataTransfer.files

  selectFiles: =>
    select = document.querySelector('#' + @uniqueId + ' .select-area')
    @uploadFiles select.files

  uploadFiles: (files) =>
    @uploadFile file for file in files

  uploadFile: (file) =>
    if @formName != undefined
      formName = @formName
    else
      formName = 'asset[image]'

    if @options && @options.method
      ajaxMethod = @options.method
    else
      ajaxMethod = 'POST'

    data = new FormData()
    data.append formName, file
    
    ajaxHash = 
      url: @ajaxUrl
      type: ajaxMethod
      data: data
      cache: false
      contentType: false
      processData: false
      success: (response) =>
        $('#' + @uniqueId + ' .result-area').append response
    $.ajax ajaxHash, 'json'
