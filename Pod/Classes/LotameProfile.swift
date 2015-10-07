//
//  LotameProfile.swift
//
// Created by Dan Rusk
// The MIT License (MIT)
//
// Copyright (c) 2015 Lotame
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

@objc
public class LotameProfile: NSObject{
    public let pid:String
    public var audiences: [LotameAudience] = []
    
    public var jsonString:String? {
        return json.rawString()
    }
    
    public var json: JSON{
        var json: JSON = ["Profile": ["pid": pid]]
        json["Profile"]["Audiences"] = JSON(["Audience" : audiences.map{["id":$0.id, "abbr": $0.abbreviation]}])
        return json
    }
    
    override init(){
        //Blank for obj-c calls
        pid = ""
    }
    
    init(json: JSON){
        pid = json["Profile"]["pid"].stringValue
        for (_,audience) in json["Profile"]["Audiences"]["Audience"]{
            audiences.append(LotameAudience(json: audience))
        }
    }
}