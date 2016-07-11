_[Demo and API docs](https://adelarosab.github.io/)_


## &lt;cordova-camera&gt;

`<cordova-camera>` access to camera for cordova applications.

```html
<cordova-core
  allow-edit
  direction="back"
  destination="data_url"
  encoding="png"
  media="{{picture}}"
  quality="100"
  ready
  save
  size="100x100"
></cordova-core>
```
### Attributes

#### destination

Choose the format of the return value ("data_url", "file_uri" Android, "native_uri" iOS).

#### direction

Choose the camera to use ("front"- or "back"-facing).

#### edit

Allow simple editing of image before selection.

#### encoding

Choose the returned image file's encoding ("png" or "jpeg").

#### media (read-only)

Result media.

#### quality

Quality of the saved image, expressed as a range of 0-100, where 100 is typically full resolution with no loss from file compression.

#### ready (read-only)

Return if cordova deviceready event has been fired.

#### save

Save the image to the photo album on the device after capture.

#### size

Combination of targetWidth and targetHeight properties (i.e.: "100x80", "100", "x80").

#### source

Set the source of the picture ("photolibrary", "camera", "savedphotoalbum").
