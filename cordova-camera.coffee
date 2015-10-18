Polymer
  is: "cordova-camera"

  properties:
    ### Allow simple editing of image before selection. ###
    allowEdit:
      reflectToAttribute: yes
      type: Boolean
      value: no
    ### Choose the camera to use ("front"- or "back"-facing). ###
    cameraDirection:
      reflectToAttribute: yes
      type: String
      value: "back"
    ### Choose the format of the return value ("data_url", "file_uri" Android,
   "native_uri" iOS). ###
    destination:
      reflectToAttribute: yes
      type: String
      value: "data_url"
    ### Choose the returned image file's encoding ("png" or "jpeg"). ###
    encoding:
      reflectToAttribute: yes
      type: String
      value: "png"
    ### Combination of targetWidth and targetHeight properties (i.e.: "100x80",
   "100", "x80"). ###
    maxSize:
      observer: "_observeSize"
      reflectToAttribute: yes
      type: String
    ### Result media ###
    media:
      notify: true
      readOnly: yes
      type: String
    ### Ready ###
    ready:
      notify: yes
      readOnly: yes
      reflectToAttribute: yes
    ### Quality of the saved image, expressed as a range of 0-100, where 100 is
    typically full resolution with no loss from file compression. ###
    quality:
      reflectToAttribute: yes
      type: Number
      value: 50
    ### Save the image to the photo album on the device after capture. ###
    saveToGallery:
      reflectToAttribute: yes
      type: Boolean
      value: no
    ### Set the source of the picture ("photolibrary", "camera",
   "savedphotoalbum"). ###
    source:
      reflectToAttribute: yes
      type: String
      value: "camera"

  _media: (media) ->
    Camera = navigator.camera

    size = @maxSize?.split? "x"
    options =
      allowEdit: @allowEdit
      cameraDirection: Camera.Direction[@cameraDirection.toUpperCase()]
      destinationType: Camera.DestinationType[@destination.toUpperCase()]
      encodingType: Camera.EncodingType[@encoding.toUpperCase()]
      mediaType: Camera.MediaType[media.toUpperCase()] # it should be provided
      quality: @quality
      saveToPhotoAlbum: @saveToGallery
      sourceType: Camera.PictureSourceType[@source.toUpperCase()]
      targetHeight: size?[1]
      targetWith: size?[0]

    if @ready
      setMedia = (media) =>
        media = "data:image/jpeg;base64," + media if @destination is "data_url"
        @_setMedia media

      navigator.camera.getPicture setMedia,
        (@fire.bind this, "cordova-camera-error"),
        options

  ### Allow selection from all media types. ###
  all: ->
    @_media "allmedia"

  ### Allow selection of still pictures only. ###
  photo: ->
    @_media "picture"

  ### Allow selection of video only. ###
  video: ->
    @_media "video"
