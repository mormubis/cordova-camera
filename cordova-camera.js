'use strict';

Polymer(
  {
    is: 'cordova-camera',

    properties: {
      /**
       * Choose the format of the return value ("data_url", "file_uri"
       * Android, "native_uri" iOS).
       */
      destination: {
        type: String,
        value: 'data_url'
      },

      /**
       * Choose the camera to use ("front"- or "back"-facing).
       */
      direction: {
        type: String,
        value: 'back'
      },

      /**
       * Allow simple editing of image before selection.
       */
      edit: Boolean,

      /**
       * Choose the returned image file's encoding ("png" or "jpeg").
       */
      encoding: {
        type: String,
        value: 'png'
      },

      /**
       * Result media.
       */
      media: {
        notify: true,
        readOnly: true,
        type: String
      },

      /**
       * Quality of the saved image, expressed as a range of 0-100, where
       * 100 is typically full resolution with no loss from file compression.
       */
      quality: {
        type: Number,
        value: 100
      },

      /**
       * Return if cordova deviceready event has been fired.
       */
      ready: {
        computed: '_computeReady(_ready_, _paused_)',
        notify: true,
        type: Boolean,
        value: false
      },

      /**
       * Save the image to the photo album on the device after capture.
       */
      save: Boolean,

      /**
       * Combination of targetWidth and targetHeight properties (i.e.:
       * "100x80", "100", "x80").
       */
      size: String,

      /**
       * Set the source of the picture ("photolibrary", "camera",
       * "savedphotoalbum").
       */
      source: {
        type: String,
        value: 'camera'
      }
    },

    _computeReady(ready, paused) {
      return ready && !paused;
    },

    _get(media) {
      if (!this.ready) {
        return;
      }

      const Camera = navigator.camera;
      const DestinationType = Camera.DestinationType;
      let size = this.size && this.size.split && this.size.split('x') || [];
      let options = {
        allowEdit: this.allowEdit,
        cameraDirection: Camera.Direction[this.direction.toUpperCase()],
        destinationType: DestinationType[this.destination.toLocaleUpperCase()],
        encodingType: Camera.EncodingType[this.encoding.toUpperCase()],
        mediaType: Camera.MediaType[media.toUpperCase()],
        quality: this.quality,
        saveToPhotoAlbum: this.save,
        sourceType: Camera.PictureSourceType[this.source.toUpperCase()],
        targetHeight: size[1],
        targetWidth: size[0]
      };

      Camera.getPicture(
        (media) => {
          const DATA_URL = DestinationType['DATA_URL'];

          if (options.destinationType === DATA_URL) {
            media = `data:image/${this.encoding};base64,` + media;
          }

          this._setMedia(media);
        },
        this.fire.bind(this, 'cordova-camera-error'),
        options
      );
    },

    all() {
      this._get('allmedia');
    },

    photo() {
      this._get('picture');
    },

    video() {
      this._get('video');
    }
  }
);
