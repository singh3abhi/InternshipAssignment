# Internship Assignment For ORU Phones

I created the required Internship Assignment with Flutter as a front-end client and Bloc pattern for application design because it helps in separating the data, logic, and the UI part. I have also implemented Cubit for the app's State Management which is an effective way of managing the state.

## Image Caching
I have used Cached_network_package for caching the network images, When the image is loaded the first time it takes several seconds depending on the size, once it is loaded Cached_Network_Image caches the image in the temp directory, and the next time when a similar image is requested to load it fetches the image from memory thus saving the time of making API request and downloading the image.

## Memory Management
We have used caching in the application which sometimes leads to big junk of cache memory, So I came up with the solution that the user only requires image cache data when the app is in Running State, As soon as the app goes into Background or Terminated State there is no use of that image cache because next time on start of application it will make new api request and new data will be fetched, So I implemented logic in main.dart that when app goes in Background or Terminated State it will clear Image cache thus making our app memory efficient.

## Sample Video and Apk File
https://drive.google.com/drive/u/0/folders/1RRblR35-nFbWNKDBxpN5LRz_wW2qMStp


## Installation
First of all Clone this repository:
```bash
 git clone https://github.com/singh3abhi/InternshipAssignment
```
After cloning this repository, migrate to ```InternshipAssignment``` folder.<br />
Then, follow the following steps:<br />
Run the following commands to run the app:<br />
```bash
  flutter pub get
  flutter run --release
```
To generate the apk:
```bash
   flutter build apk --release
```
Then you can find the apk in InternshipAssignment\build\app\outputs\flutter-apk

## For Firebase Cloud Push Notifications

We can send push Notifications by making post api
```bash
   https://fcm.googleapis.com/fcm/send
```
Add the Header (FCM Server key)
```bash
   header - Authorization
   value -  key = AAAAJTjOfCY:APA91bEtJcXnFqV9o2Ep_N3svDspmKFoeT8cC4wyYcT9-nas3zFaMkhdoHmE8yKhWW8gJPsTutEYKvjoyurylEpVc7fyVFtwN2y56mVtKtK53wIuZ-gCk9GJqQWZq_Tawdgp7lXPCUc9
```
To get the device token run the code in debug mode and copy the device token from debug console. Sometimes Device refreshes the token so make sure u are using latest token before sending post request. <br />
Body:
```bash
   {
  "to" : Enter devicetoken here,
  "notification" : {
    "title" : "ORU Phones",
    "body" : "Internship Assignment is due today",
    "android_channel_id" : "1"
    
  },
  "data" : {
    "type" : "Notification",
    "id" : "12345"
  }
}
```
