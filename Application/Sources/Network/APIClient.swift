//
// Example Project
// Copyright © 2023 Wisemen
//

import Alamofire
import AppwiseCore
import Nuke
import NukeAlamofirePlugin

final class APIClient: Client {
	typealias RouterType = APIRouter

	static let shared = APIClient()

	private let interceptor = AuthenticationInterceptor(authenticator: OAuth2Authenticator(), credential: OAuth2Grant.grant)

	let session: Session
	let nuke: ImagePipeline

	init() {
		let newSession = Session(interceptor: interceptor)

		session = newSession
		nuke = .init { $0.dataLoader = AlamofireDataLoader(session: newSession) }
	}

	func nukeOptions(placeholder: PlatformImage? = nil, transition: ImageLoadingOptions.Transition? = nil, failureImage: PlatformImage? = nil, failureImageTransition: ImageLoadingOptions.Transition? = nil, contentModes: ImageLoadingOptions.ContentModes? = nil) -> ImageLoadingOptions {
		var options = ImageLoadingOptions(placeholder: placeholder, transition: transition, failureImage: failureImage, failureImageTransition: failureImageTransition, contentModes: contentModes)
		options.pipeline = nuke
		return options
	}
}
