//
// Example Project
// Copyright © 2023 Wisemen
//

import Alamofire
import AppwiseCore
import Nuke
import NukeAlamofirePlugin
import NukeExtensions

final class APIClient: Client {
	typealias RouterType = APIRouter

	static let shared = APIClient()

	private let interceptor = AuthenticationInterceptor(authenticator: OAuth2Authenticator(), credential: OAuth2Grant.grant)
	let session: Session
	let nuke: ImagePipeline

	init() {
		let session = Session(interceptor: interceptor)
		self.session = session
		nuke = .init { $0.dataLoader = AlamofireDataLoader(session: session) }
	}

	func nukeOptions(placeholder: PlatformImage? = nil, transition: ImageLoadingOptions.Transition? = nil, failureImage: PlatformImage? = nil, failureImageTransition: ImageLoadingOptions.Transition? = nil, contentModes: ImageLoadingOptions.ContentModes? = nil) -> ImageLoadingOptions {
		var options = ImageLoadingOptions(placeholder: placeholder, transition: transition, failureImage: failureImage, failureImageTransition: failureImageTransition, contentModes: contentModes)
		options.pipeline = nuke
		return options
	}
}
