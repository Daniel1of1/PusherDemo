# Purpose

This was a quick proof of concept with the idea of showing the simplest feature of the [Pusher](https://pusher.com) service in an iOS app the same way the website does with the `curl` command. The idea being that a user could paste in 2 commands (one to set the iPhone app up and one to send the API request) and see a message appear on both the iphone and the website.

Below is a gif of the whole process (with time spent compiling clipped out)

# Requirements

- [CocoaPods](https://cocoapods.org) 1.0.0.beta.3
  - `gem install cocoapods --pre`
- Xcode 7.2 or greater.

# How to use

in terminal replacing the AABBCCDD with the `channel` part of the data sent in the `curl` command on [Pusher.com](https://pusher.com)

```sh
env PUSHER_DEMO_CHANNEL=AABBCCDD pod try https://github.com/Daniel1of1/PusherDemo
```

CocoaPods will set up the iOS app. Follow any on screen instructions and hit 'Build and Run' in Xcode when it shows up. Then paste in the pusher command in your terminal and see both messages appear simultaneously in the browser and on the iPhone 🙃.

# How it works

There are two parts to how this works. 

1. The first part is the (rather plain looking 😖 ) app. This is just a very simple "Single View Controller app" which uses the [libPusher](https://github.com/lukeredpath/libPusher) library, to subscribe a channel that we define in the setup command (explained below) and pop up the message we receive from the channel.

2. The second part is a 'setup' process, in which we have a pre install script that 
	A. checks where `PUSHER_DEMO_CHANNEL` environment variable exists (exits if not). 
	B. it writes the value to a temporary file, which is then read by the app to know which app to subscribe to.

Most of the functionality relies on [cocoapods-try](https://github.com/cocoapods/cocoapods-try). A cocoapods plugin bundled with CocoaPods. 'try' was created to allow users to try a certain library, usually in the context of a demo app. for example `pod try Alomafire`. Try allows you to define pre-install hooks that are intented to help setup the project for demo use. You can see this in `.cocoapods.yml`

# Taking the idea further
  
- `podTrySetup.swift` could hit [curl_command_text](http://pusher.com/utilities/curl_command_text.json) end point, extracting both the text and the channel to subscribe to... Subcsribe to that channel and display the text for the terminal command (just as the landing page does). This would remove the need for the `env PUSHER_DEMO_CHANNEL=AABBCCDD`. The downside of this is that you don't get the simultanous messages if you were to have both the website and the app open. _Further_ you could have the a page on the front end that subscribes to a particular channel via a query parameter which one could display on the iPhone simulator screen, in the same way you would the terminal command.) But that of course just makes the demo even more complex, which goes against what I imagine is the whole point of it.

Thanks for reading 🙃

