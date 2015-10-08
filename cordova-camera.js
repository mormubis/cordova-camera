// Generated by CoffeeScript 1.10.0
(function() {
  Polymer({
    is: "cordova-camera",
    properties: {
      _media: {
        type: String
      },
      allowEdit: {
        reflectToAttribute: true,
        type: Boolean,
        value: false
      },
      cameraDirection: {
        reflectToAttribute: true,
        type: String,
        value: "back"
      },
      encoding: {
        reflectToAttribute: true,
        type: String,
        value: "png"
      },
      media: {
        readOnly: true,
        type: String
      },
      output: {
        reflectToAttribute: true,
        type: String,
        value: "data_url"
      },
      quality: {
        reflectToAttribute: true,
        type: Number,
        value: 50
      },
      saveAlbum: {
        reflectToAttribute: true,
        type: Boolean,
        value: false
      },
      size: {
        observer: "_observeSize",
        reflectToAttribute: true,
        type: String
      },
      source: {
        reflectToAttribute: true,
        type: String,
        value: "camera"
      }
    },
    _media: function(media) {
      return navigator.camera.getPicture(this._setMedia, this.fire.bind(this, "cordova-camera-error"));
    },
    all: function() {},
    photo: function() {},
    video: function() {}
  });

}).call(this);

//# sourceMappingURL=cordova-camera.js.map
