// DGResource.m
//
// Copyright (c) 2017 Maxime Epain
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "DGEndpoint+Private.h"
#import "DGResource.h"

static NSCache *DGImageCache() {
    static NSCache *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[NSCache alloc] init];
    });
    return cache;
}

@implementation DGResource

- (void)getImage:(NSString *)imageURL success:(void (^)(UIImage *image))success failure:(nullable DGFailureBlock)failure {
    NSOperation *operation = [self createImageRequestOperationWithUrl:imageURL success:success failure:failure];
    [self.queue addOperation:operation];
}

- (NSOperation *)createImageRequestOperationWithUrl:(NSString *)url success:(void (^)(UIImage *image))success failure:(nullable DGFailureBlock)failure {
    
    UIImage *image = [DGImageCache() objectForKey:url];
    if (image) {
        success(image);
    }
    
    NSString *path = url;
    
    if (self.proxyURL) {
        NSURL *discogsURL = [NSURL URLWithString:url];
        path = [NSString stringWithFormat:@"%@%@", self.proxyURL, discogsURL.path];
    }
    
    NSURLRequest *requestURL = [self.manager.HTTPClient requestWithMethod:@"GET" path:path parameters:nil];
    
    AFRKImageRequestOperation *operation = [AFRKImageRequestOperation imageRequestOperationWithRequest:requestURL imageProcessingBlock:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [DGImageCache() setObject:image forKey:url];
        success(image);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    return operation;
}

@end
