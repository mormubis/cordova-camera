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
    size = size?.split? "x"
    options =
      allowEdit: @allowEdit
      cameraDirection: camera.Direction[@cameraDirection.toUpperCase()]
      destinationType: camera.DestinationType[@output.toUpperCase()]
      encodingType: camera.EncodingType[@encoding.toUpperCase()]
      mediaType: camera.MediaType[media.toUpperCase()] # it should be provided
      quality: @quality
      saveToPhotoAlbum: @saveToGallery
      sourceType: camera.PictureSourceType[@source.toUpperCase()]
      targetHeight: size?[1]
      targetWith: size?[0]

    options.allowEdit ?= false
    options.cameraDirection ?= camera.Direction.BACK
    options.destinationType ?= camera.DestinationType.DATA_URL
    options.encodingType ?= camera.EncodingType.PNG
    options.quality = 50 if 0 > @quality < 100
    options.saveToPhotoAlbum ?= false
    options.sourceType ?= camera.PictureSourceType.CAMERA
    options.targetHeight ?= undefined
    options.targetWidth ?= undefined

    this.$.enabler.promise.then =>
      navigator.camera.getPicture ( (media) => @_setMedia media ),
        (@fire.bind this, "cordova-camera-error"),
        options

  all: ->
    @_media "allmedia"

  photo: ->
    @_media "picture"

  video: ->
    @_media "video"
