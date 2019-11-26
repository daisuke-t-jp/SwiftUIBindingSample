//
//  AppData.swift
//  SwiftUIBindingSample
//
//  Created by Daisuke TONOSAKI on 2019/11/26.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import Combine
import SwiftUI

final class AppData: ObservableObject {
    @Published var persons = personData
}
