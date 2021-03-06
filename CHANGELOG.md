#Change Log
All notable changes to `DiscogsAPI` project will be documented in this file.

--- 

## [1.7.1](https://github.com/maxep/DiscogsAPI/releases/tag/1.7.1) - February 14, 2017

#### Fixed
- Swift interpolation of failure callback.

#### Added
- Image cache in resources.

#### Updated
- Examples layout.

## [1.7.0](https://github.com/maxep/DiscogsAPI/releases/tag/1.7.0) - January 24, 2017

#### Added
- Class method `[DGIdentity current]` to get the currently authenticated user's identity.
- `DGObjectManager` class to manage App key/secret or personal access token and create request operation.
- `DGCollectionFieldsRequest`.
- `[DGCollection getItemsByRelease:success:failure:]`.
- - Collection tests.

#### Removed
- Method `[Discogs isAuthenticated:]`: Authentication can be check with `[DGAuthentication identityWithSuccess:failure:]`

#### Updated
- `DGReleaseInstance` structure.
- Refacto `[DGCollection getCollectionFolders:success:failure:]` to `[DGCollection getFolders:success:failure:]`.
- Refacto `[DGCollection getCollectionFolder:success:failure:]` to `[DGCollection getFolder:success:failure:]`.
- Refacto `[DGCollection deleteCollectionFolder:success:failure:]` to `[DGCollection deleteFolder:success:failure:]`.
- Refacto `[DGCollection createCollectionFolder:success:failure:]` to `[DGCollection createFolder:success:failure:]`.
- Refacto `[DGCollection getCollectionReleases:success:failure:]` to `[DGCollection getItemsByFolder:success:failure:]`.
- Refacto `[DGCollection addToCollectionFolder:success:failure:]` to `[DGCollection addToFolder:success:failure:]`.
- Refacto `[DGCollection getCollectionFields:success:failure:]` to `[DGCollection getFields:success:failure:]`.
- Refacto `[DGCollection editFieldsInstance:success:failure:]` to `[DGCollection editField:success:failure:]`.


#### Fixed
- DGReleaseInstance ID mapping.

## [1.6.2](https://github.com/maxep/DiscogsAPI/releases/tag/1.6.2) - December 6, 2016

#### Added
- Add Identity to endpoints.

## [1.6.1](https://github.com/maxep/DiscogsAPI/releases/tag/1.6.1) - November 27, 2016

#### Fixed
- Fix parameters encoding for HTTP request methods other than `GET`, `HEAD` or `DELETE`.
- Fix external browser authentication.

#### Added
- Refactor `DGMasterVersionRequest` to `DGMasterVersionsRequest`.
- Refactor `DGArtistReleaseRequest ` to `DGArtistReleasesRequest`.
- Add identity to the authent flow and store identity into keychain instead of tokens only.

## [1.6.0](https://github.com/maxep/DiscogsAPI/releases/tag/v1.6.0) - November 4, 2016

#### Added
- Listings and Orders to Marketplace endpoint.
- Unit tests.

#### Removed
- Carthage compatibility. RestKit is now a pod dependency using frameworks.
  As RestKit is not compatible with Carthage and to avoid duplicated symbols, Carthage can't be supported.

#### Updated
- Upgrade to RestKit 0.27.0
- `[DiscogsAPI client]` has been renamed to `[Discogs api]`.
- Swift 3 in example.

#### Fixed
- CocoaPods 1.1.1
- External browser authentication.

## [1.5.0](https://github.com/maxep/DiscogsAPI/releases/tag/v1.5.0) - July 1, 2016

#### Added
- Modular framework project.
- Swift compatibility.
- Carthage compatibility.
- Added format and field objects [#8](https://github.com/maxep/DiscogsAPI/pull/8).
- Added a get instance from folder method to collection [#8](https://github.com/maxep/DiscogsAPI/pull/8).

#### Fixed
- Fixed nil managers of wantlist and collections [#6](https://github.com/maxep/DiscogsAPI/pull/6).

## [1.4.2](https://github.com/maxep/DiscogsAPI/releases/tag/v1.4.2) - November 26, 2015

#### Updated
- Upgrade to RestKit 0.26.0

## [1.4.1](https://github.com/maxep/DiscogsAPI/releases/tag/v1.4.1) - October 6, 2015

#### Fixed
- Fix a major OAuth issue.

##~~[1.4](https://github.com/maxep/DiscogsAPI/releases/tag/v1.4)~~, August 28, 2015

#### Updated
- Upgrade to RestKit 0.25.0
