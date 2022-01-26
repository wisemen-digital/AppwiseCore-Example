//
// Example Project
// Copyright © 2022 Appwise
//

import Alamofire
import AppwiseCore
import Nuke
import NukeAlamofirePlugin

final class APIClient: Client {
	typealias RouterType = APIRouter

	static let shared = APIClient()

	private let interceptor = AuthenticationInterceptor(authenticator: OAuth2Authenticator(), credential: OAuth2Grant.grant)
	private(set) lazy var session: Session = Session(interceptor: interceptor)
	private(set) lazy var nuke = Nuke.ImagePipeline {
		$0.dataLoader = NukeAlamofirePlugin.AlamofireDataLoader(session: self.session)
	}

	func nukeOptions(placeholder: PlatformImage? = nil, transition: ImageLoadingOptions.Transition? = nil, failureImage: PlatformImage? = nil, failureImageTransition: ImageLoadingOptions.Transition? = nil, contentModes: ImageLoadingOptions.ContentModes? = nil) -> ImageLoadingOptions {
		var options = ImageLoadingOptions(placeholder: placeholder, transition: transition, failureImage: failureImage, failureImageTransition: failureImageTransition, contentModes: contentModes)
		options.pipeline = nuke
		return options
	}
}
