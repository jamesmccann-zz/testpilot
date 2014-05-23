testpilot
=========

Welcome to Testpilot!

#### Setup

1. Clone
2. Run `bundle install`
3. Run `rake db:setup`
4. Run `rails server`
5. Run `rake resque:work`
5. Open [http://localhost:3000](http://localhost:3000)

> Note: This application requires `apktool` - run `brew install apktool` or `apt-get install apktool` to install.



#### Uploading builds

1. Ensure you have an App. Note it's ID and build token
2. Find the APK file you want to upload
3. Use `curl` to upload the file, like so: `curl -X POST -F "build[apk]=@spike-android-debug-unaligned.apk" "https://[HOST]/api/apps/[APP ID]/builds?build_token=[]YOUR TOKEN]"`
4. You will receive JSON response with either errors or details of the created object