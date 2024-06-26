import ExtrasBase64
import NIOCore
//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftRTC open source project
//
// Copyright (c) 2024 ngRTC and the SwiftRTC project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftRTC project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//
import STUN

// swift run StunDecode AAEAHCESpEJML0JTQWsyVXkwcmGALwAWaHR0cDovL2xvY2FsaG9zdDozMDAwLwAA
// Binding request l=28 attrs=1 id=TC9CU0FrMlV5MHJh

@main
struct StunDecoder {
    static func main() throws {
        // just to get an ArraySlice<String> from [String]
        let arguments = CommandLine.arguments.dropFirst()

        guard let encodedData = arguments.first else {
            print("missing base64 data")
            return
        }

        let decodedData = try Base64.decode(string: encodedData)

        var message = Message()
        message.raw = ByteBuffer(bytes: decodedData)

        do {
            try message.decode()
            print("\(message)")
        } catch let err {
            print("Unable to decode message \(err)")
        }
    }
}
