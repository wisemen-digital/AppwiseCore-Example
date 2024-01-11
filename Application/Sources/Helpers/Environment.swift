//
// Example Project
// Copyright © 2023 Wisemen
//

import Foundation

@frozen
enum EnvironmentValue<T> {
	case dev(T)
	case tst(T)
	case stg(T)
	case prd(T)
}

func env<T>(_ envs: EnvironmentValue<T>...) -> T {
	var defaultValue: T!

	for environment in envs {
		switch environment {
		case .dev(let value):
			#if ENVIRONMENT_DEVELOPMENT
			return value
			#endif
		case .tst(let value):
			#if ENVIRONMENT_TEST
			return value
			#endif
		case .stg(let value):
			#if ENVIRONMENT_STAGING
			return value
			#endif
		case .prd(let value):
			defaultValue = value
		}
	}

	return defaultValue
}
