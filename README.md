
# react-native-background-location-update

## Getting started

`$ npm install react-native-background-location-update --save`

### Mostly automatic installation

`$ react-native link react-native-background-location-update`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-background-location-update` and add `RNBackgroundLocationUpdate.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBackgroundLocationUpdate.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.dh.background.location.RNBackgroundLocationUpdatePackage;` to the imports at the top of the file
  - Add `new RNBackgroundLocationUpdatePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-background-location-update'
  	project(':react-native-background-location-update').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-background-location-update/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-background-location-update')
  	```


## Usage
```javascript
import RNBackgroundLocationUpdate from 'react-native-background-location-update';

// TODO: What to do with the module?
RNBackgroundLocationUpdate;
```
  # background-location-update-v1
