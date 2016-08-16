_[Demo and API docs](https://adelarosab.github.io/cordova-camera)_

### &lt;cordova-camera&gt;
`<cordova-camera>`  provides an interface for taking pictures and for 
choosing images or videos from the system's image library. 
status.

### Installation
In your `www` project:
```bash
bower install --save cordova-camera
```

In your `cordova` project:
```bash
cordova plugin add cordova-plugin-camera
```

### Usage
```html
<cordova-camera
  allow-edit
  direction="back"
  destination="data_url"
  encoding="png"
  media="{{picture}}"
  quality="100"
  ready
  save
  size="100x100"
></cordova-camera>
```

`<cordova-camera>` allow to take pictures and videos from the system. `ready` 
means cordova is fully operative and element is allow to provide pictures and
 videos.
 
 There are some special treatments into the different platforms. For example:
  iOS doesn't allow `file_uri` destination, instead use `native_uri`. 
  Please take a look the [documentation](http://cordova.apache.org/docs/en/6.x/reference/cordova-plugin-camera/index.html) 
  for more information.

---

###### Note
Due to restrictions `ready` attribute is not shown into attributes table.
