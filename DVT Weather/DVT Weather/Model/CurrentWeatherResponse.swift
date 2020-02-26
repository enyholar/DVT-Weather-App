/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct CurrentWeatherResponse : Codable {
	let id : Int?
	let main : Main?
	let name : String?
	let timezone : Int?
	let sys : Sys?
	let visibility : Int?
	let wind : Wind?
	let dt : Int?
	let base : String?
	let weather : [Weather]?
	let cod : Int?
	let clouds : Clouds?
	let coord : Coord?

    
    init( id : Int?, main : Main?, name : String?, timezone : Int?, sys : Sys?, visibility : Int?, wind : Wind?, dt : Int?, base : String?, weather : [Weather]?, cod : Int?, clouds : Clouds?, coord : Coord?) {
         self.id = id
         self.main = main
         self.name = name
         self.timezone = timezone
         self.sys = sys
         self.visibility = visibility
         self.wind = wind
         self.dt = dt
         self.base = base
         self.weather = weather
         self.cod = cod
         self.clouds = clouds
         self.coord = coord
     }
    
	enum CodingKeys: String, CodingKey {

		case id = "id"
		case main = "main"
		case name = "name"
		case timezone = "timezone"
		case sys = "sys"
		case visibility = "visibility"
		case wind = "wind"
		case dt = "dt"
		case base = "base"
		case weather = "weather"
		case cod = "cod"
		case clouds = "clouds"
		case coord = "coord"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		main = try values.decodeIfPresent(Main.self, forKey: .main)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
		sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
		visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
		wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
		dt = try values.decodeIfPresent(Int.self, forKey: .dt)
		base = try values.decodeIfPresent(String.self, forKey: .base)
		weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
		cod = try values.decodeIfPresent(Int.self, forKey: .cod)
		clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
		coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
	}

}
