Polymer
  is: "cordova-camera"

  properties:
    _media:
      type: String

    allowEdit:
      reflectToAttribute: yes
      type: Boolean
      value: no
    cameraDirection:
      reflectToAttribute: yes
      type: String
      value: "back"
    encoding:
      reflectToAttribute: yes
      type: String
      value: "png"
    media:
      notify: true
      readOnly: yes
      type: String
    output:
      reflectToAttribute: yes
      type: String
      value: "data_url"
    quality:
      reflectToAttribute: yes
      type: Number
      value: 50
    saveToGallery:
      reflectToAttribute: yes
      type: Boolean
      value: no
    size:
      observer: "_observeSize"
      reflectToAttribute: yes
      type: String
    source:
      reflectToAttribute: yes
      type: String
      value: "camera"

  _media: (media) ->
    camera = navigator.camera
    size = size.split "x"
    options =
      allowEdit: @allowEdit || false
      cameraDirection: camera.Direction[@cameraDirection.toUpperCase()] || camera.Direction.BACK
      destinationType: camera.DestinationType[@output.toUpperCase()] || camera.DestinationType.DATA_URL
      encodingType: camera.EncodingType[@encoding.toUpperCase()] || camera.EncodingType.PNG
      mediaType: camera.MediaType[media.toUpperCase()] # it should be provided
      quality: if 0 < @quality < 100 then @quality else 50
      saveToPhotoAlbum: @saveToGallery || false
      sourceType: camera.PictureSourceType[@source.toUpperCase()] || camera.PictureSourceType.CAMERA
      targetHeight: size?[1] || undefined
      targetWith: size?[0] || undefined

    this.$.enabler.promise.then =>
      navigator.camera.getPicture @_setMedia,
        (@fire.bind this, "cordova-camera-error"),
        options

  all: ->
    @_media "allmedia"

  photo: ->
    @_media "picture"

  video: ->
    @_media "video"
