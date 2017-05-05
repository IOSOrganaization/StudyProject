//
//  MutableURLRequest.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-8-8.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "MutableURLRequest.h"
@interface MutableURLRequest(){
    
}
@end
@implementation MutableURLRequest
-(void) baseMethod{
    // 网络请求
    [self httpPostRequestMethod];
}
-(void) httpGetRequestMethod{
    
}
-(void) httpPostRequestMethod{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.54:65012/stateControl.aspx"];
    NSString *message = @"action=1&userId=123&password=123";
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:url];
    // HTTP Headers
    NSString *messageLength = [NSString stringWithFormat:@"%d",[message length]];
    [postRequest addValue:@"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [postRequest addValue:messageLength forHTTPHeaderField:@"Content-Length"];
    [postRequest setHTTPMethod:@"POST"];
    // HTTP Body
    [postRequest setHTTPBody:[message dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Send Request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:postRequest delegate:self];
    if(connection != nil){
        // 连接成功,开始接受返回数据
         receivedData = [NSMutableData data];
    }else{
        // 连接失败
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 网络连接状态可见性
    }
}
#pragma mark -NSURLConnectionDataDelegate
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    // 开始返回数据
    [receivedData setLength:0];
}
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    // 开始接受返回数据
    [receivedData appendData:data];
}
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    // 连接错误
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    [MyLog info:@"连接错误:ERROR=%@", error];
}
-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    // 连接请求接受完成
    const void *receivedBytes = [receivedData mutableBytes]; // Data Bytes
    int dataLength = [receivedData length];
    NSString *theResponse = [[NSString alloc] initWithBytes:receivedBytes length:dataLength encoding:NSUTF8StringEncoding];
//    [MyLog info:@"接收到的数据:%@",theResponse];
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
@end
