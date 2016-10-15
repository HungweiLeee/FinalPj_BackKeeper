namespace :user do

	task :make_fake_user => :environment do

		u1 = User.create(email: "111@111.com", nickname: "Web10", password: "111111", authentication_token: "jkbweovbwvnlwdew")
			p1 = u1.places.create(shop_name: "Joseph Bistro 想想廚房", address: "台北市中山區松江路69巷13號", 
														summary: "小吃店", big_bag: "2", small_bag: "6", phone: "02-22783343")
			p2 = u1.places.create(shop_name: "Alpha Camp", address: "台北市中山區南京東路二段97號5 樓",
														summary: "培育全球Startup渴求的人才", big_bag: "12", small_bag: "26", phone: "02-22783343")
			p21 = u1.places.create(shop_name: "樹樂集", address: "台北市大同區民族西路33號",
														summary: "咖啡廳", big_bag: "12", small_bag: "26", phone: "02-22783343")
			p22 = u1.places.create(shop_name: "獅子甜點", address: "台北市中山區中山北路二段115巷3弄23號",
														summary: "甜品餐廳", big_bag: "12", small_bag: "26", phone: "02-22783343")

			
		u2 = User.create(email: "111@112.com", nickname: "jj1023", password: "111111", authentication_token: "jkb23vbwvnlwdew")
			p3 = u2.places.create(shop_name: "果新米蘭蔬食", address: "台北市中山區南京東路二段65號", 
														summary: "義大利餐廳", big_bag: "22", small_bag: "6", phone: "02-22783343")
			p3 = u2.places.create(shop_name: "歸綏街文萌樓", address: "台北市大同區歸綏街139號", 
														summary: "歷史地標", big_bag: "22", small_bag: "6", phone: "02-22783343")

		u3 = User.create(email: "111@113.com", nickname: "Jcena", password: "111111", authentication_token: "jkb23vbwvn111dew")
			p5 = u3.places.create(shop_name: "FUTUREWARD 未來產房", address: "台北市中山區中山北路三段40號", 
														summary: "全台灣最具規模的自造者空間", big_bag: "8", small_bag: "4", phone: "02-22783343")
			p4 = u3.places.create(shop_name: "六度空間", address: "台北市中山區中山北路二段185號", 
														summary: "雷射漆彈場", big_bag: "18", small_bag: "14", phone: "02-22783343")
	end
end