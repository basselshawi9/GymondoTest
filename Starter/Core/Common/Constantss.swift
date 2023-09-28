//
//  Common.swift
//  HaveBreak
//
//  Created by iMac on 2/20/23.
//

import Foundation
import Alamofire
import UIKit
import SwiftUI
import AVFoundation


let APIKEY = "A+dat4F)mwFaUU,38]Z5BvAySR(y/xJ#@m9Wt5_wUZRrmB*T>jD82{CppaYh!+MG"


func NO_AUTHORIZATION_HEADER() -> HTTPHeaders{
    return ["APIKEY": APIKEY,
            "Content-Type": "application/json; charset=utf-8"]
}

func AUTHORIZATION_HEADER() -> HTTPHeaders{
    
    let token = ""
    return ["Authorization":"Bearer \(token)",
            "Content-Type": "application/json; charset=utf-8"]
}


func uniqueKey()-> String {
    UUID().uuidString
}

var amPmTimeFormatter : DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    formatter.dateFormat = "hh:mm a"
    return formatter
}()

var dayTimeFormatter : DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    formatter.dateFormat = "dd/MM"
    return formatter
}()

var dayFromTimeFormatter : DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    formatter.dateFormat = "MMMM/d"
    return formatter
}()

var zoneTimeFormatter : DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy/MM/dd\nHH:mm a"
    return formatter
}()

let posixDateFormat : DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    return dateFormatter
}()

let plainDateFormat : DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter
}()

let posixDateFormat2 : DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    return dateFormatter
}()

let posixDateFormatTimeZone : DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"
    return dateFormatter
}()

func getDateFrom(val:String)->Date {
    
    posixDateFormat2.date(from: val) ?? Date()
}

func getDateFrom2(val:String)->Date {
    
    posixDateFormat.date(from: val) ?? Date()
}

func getDateFromTimeZone(val:String)->Date {
    
    posixDateFormatTimeZone.date(from: val) ?? Date()
}

func getDayFrom(val:String)->String {
    
    let date = posixDateFormat2.date(from: val) ?? Date()
    return dayTimeFormatter.string(from: date)
}

func getFlightDayFrom(val:String)->String {
    
    let date = posixDateFormat2.date(from: val) ?? Date()
    return zoneTimeFormatter.string(from: date)
}

func delay(_ time:Double, closure: @escaping ()->()) {
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+time) {
        closure()
    }
}

func formatterdDouble(val:Double)->String {
    return String(format: "%.2f", val)
}


func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint,textColor:UIColor,size:CGFloat) -> UIImage {
    
    let textFont = UIFont(name: "Glory-Medium", size: size)!
    
    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
    
    let textFontAttributes = [
        NSAttributedString.Key.font: textFont,
        NSAttributedString.Key.foregroundColor: textColor,
    ] as [NSAttributedString.Key : Any]
    image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
    
    let rect = CGRect(origin: point, size: image.size)
    text.draw(in: rect, withAttributes: textFontAttributes)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

