//
// Example Project
// Copyright © 2021 Appwise
//

import Alamofire
import AppwiseCore
import Nuke
import NukeAlamofirePlugin

final class APIClient: Client {
	typealias RouterType = APIRouter

	static let shared = APIClient()

	private(set) lazy var sessionManager = SessionManager().then {
		let retrier = OAuth2RetryHandler(oauth2: OAuth2Grant.grant)
		$0.adapter = retrier
		$0.retrier = retrier
	}

	private(set) lazy var nuke = Nuke.ImagePipeline {
		$0.dataLoader = NukeAlamofirePlugin.AlamofireDataLoader(manager: self.sessionManager)
	}

	func nukeOptions(placeholder: Image? = nil, transition: ImageLoadingOptions.Transition? = nil, failureImage: Image? = nil, failureImageTransition: ImageLoadingOptions.Transition? = nil, contentModes: ImageLoadingOptions.ContentModes? = nil) -> ImageLoadingOptions {
		var options = ImageLoadingOptions(placeholder: placeholder, transition: transition, failureImage: failureImage, failureImageTransition: failureImageTransition, contentModes: contentModes)
		options.pipeline = nuke
		return options
	}
}
