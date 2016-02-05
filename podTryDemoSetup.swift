import Foundation

guard let pusherDemoKey = NSProcessInfo.processInfo().environment["PUSHER_DEMO_CHANNEL"] else {
	print("No environment variable found for PUSHER_DEMO_CHANNEL")
	print("please re-run the command with an API key as follows:")
	print("$ env PUSHER_DEMO_CHANNEL=ABCDEF pod try https://github.com/Daniel1of1/PusherDemo")
	exit(1)
}

pusherDemoKey.dataUsingEncoding(NSUTF8StringEncoding)?.writeToFile("/tmp/PUSHER_DEMO_KEY", atomically: true)

