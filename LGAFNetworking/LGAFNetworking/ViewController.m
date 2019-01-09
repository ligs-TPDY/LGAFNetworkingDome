//
//  ViewController.m
//  LGAFNetworking
//
//  Created by carnet on 2019/1/8.
//  Copyright © 2019 TP. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
//    [manager.requestSerializer setValue:@"Basic Y2E5OWVhZGJiYjgzMTUzNDh0NTRkOmVhZGJiYjgzMTUzNDg4ZjcxYzIzZjQ0MDQzNjBjYTk5" forHTTPHeaderField:@"Authorization"];
    
//    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-www-form-urlencoded"];
    NSDictionary *dic = @{@"type":@(1),
                          @"username":@"13910000089",
                          @"password":@"123456",
                          @"channel":@"appstore",
                          @"source":@"tgw"};
//    [manager POST:@"http://api.tgw99.cn/oauth-service/oauth/token" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"%@",error);
//    }];
    
    
    
    
//    NSDictionary* form = @{@"name":@"lisi",@"age":@(30), @"isMarryed":@(YES)};
    
//    NSMutableURLRequest* formRequest = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST"URLString:routerAddressparameters:formerror:nil];
    
    NSMutableURLRequest *formRequest = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:@"http://api.tgw99.cn/oauth-service/oauth/token" parameters:dic error:nil];
    
    [formRequest setValue:@"application/x-www-form-urlencoded; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    AFJSONResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
    
    [responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil]];
    
    manager.responseSerializer= responseSerializer;
    
//    NSURLSessionDataTask*dataTask = [manager dataTaskWithRequest:formRequest uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse*_Nonnullresponse,id_NullableresponseObject,NSError*_Nullableerror) {
//
//
//
//        NSLog(@"%@ %@", response, responseObject);
//
//    }];
    NSLog(@"%@",manager.requestSerializer.HTTPRequestHeaders);
    NSURLSessionDataTask*dataTask = [manager dataTaskWithRequest:formRequest uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject);
    }];
    
    [dataTask resume];
}


@end
