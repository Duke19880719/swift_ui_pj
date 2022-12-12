//
//  SwiftUIView_21_officanal_chart.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/10/14.
//

import SwiftUI
import Charts


struct SwiftUIView_21_officanal_chart: View {
    
    @State var taipei_weather_data = [
        weather(temperature: 15.3, year: 2022, month: 1, day: 1)
        , weather(temperature: 18.2, year: 2022, month: 2, day: 1)
        , weather(temperature: 23.3, year: 2022, month: 3, day: 1)
        , weather(temperature: 25.3, year: 2022, month: 4, day: 1)
        , weather(temperature: 26.3, year: 2022, month: 5, day: 1)
        , weather(temperature: 28.3, year: 2022, month: 6, day: 1)
        , weather(temperature: 30.3, year: 2022, month: 7, day: 1)
    ]

    @State var newtaipei_weather_data = [
        weather(temperature: 17.3, year: 2022, month: 1, day: 1)
        , weather(temperature: 18.2, year: 2022, month: 2, day: 1)
        , weather(temperature: 25.3, year: 2022, month: 3, day: 1)
        , weather(temperature: 24.3, year: 2022, month: 4, day: 1)
        , weather(temperature: 26.3, year: 2022, month: 5, day: 1)
        , weather(temperature: 25.3, year: 2022, month: 6, day: 1)
        , weather(temperature: 32.3, year: 2022, month: 7, day: 1)
    ]


    @State var Yilan_weather_data = [
        weather(temperature: 17.3, year: 2022, month: 1, day: 1)
        , weather(temperature: 13.2, year: 2022, month: 2, day: 1)
        , weather(temperature: 12.3, year: 2022, month: 3, day: 1)
        , weather(temperature: 20.3, year: 2022, month: 4, day: 1)
        , weather(temperature: 21.3, year: 2022, month: 5, day: 1)
        , weather(temperature: 18.3, year: 2022, month: 6, day: 1)
        , weather(temperature: 19.3, year: 2022, month: 7, day: 1)
    ]

    @State var chart_data:[chartdata] = []
    
    var body: some View {
        if #available(iOS 16.0, *) {
            VStack(alignment: .center){
                ScrollView{
                    GroupBox("Charts- Line Chart"){
                        Chart{
                            ForEach(chart_data,id: \.city_name) { chartdata in
                                ForEach(chartdata.data) { data in
                                    LineMark(x: .value("Month", data.date), y: .value("Temperature", data.temperature))

                                }
                                .foregroundStyle(by: .value("City", chartdata.city_name))
                                .symbol(by: .value("City", chartdata.city_name))
                                .symbolSize(60)

                            }
                            RuleMark(
                                 y: .value("average temperature", 25)
                            )
                            .foregroundStyle(.red.opacity(0.5))


                        }

                        .chartXAxis{
                            AxisMarks( values: .stride(by: .month)){ value in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(.defaultDigits))
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position:.leading){ value in
                                AxisGridLine().font(.system(size: 40,weight: Font.Weight.bold))
                                AxisValueLabel()
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYScale(domain: 0...40)
                        .chartPlotStyle { content in
                            content
                                .background(.yellow.opacity(0.1))

                        }
                        .padding(25)
                    }
                    .frame(width: .infinity, height: 450)
                    
                    GroupBox("Charts- Bar Chart 1"){
                        Chart(taipei_weather_data){ value in
            
                            BarMark(
                                x: .value("Month", value.date ),
                                y: .value("Temperature",value.animate_bool ? value.temperature : 0))
                                .annotation(position: .top) {
                                    Text("\(String(format: "%.1f", value.temperature))")
                                }

                            RuleMark(
                                 y: .value("average temperature", 25)
                            )
                            .foregroundStyle(.red.opacity(0.5))

                        }
                        .chartXAxis{
                            AxisMarks( values: .stride(by: .month)){ value in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(.defaultDigits))
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position:.leading){ value in
                                AxisGridLine().font(.system(size: 40,weight: Font.Weight.bold))
                                AxisValueLabel()
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYScale(domain: 0...40)
                        .chartPlotStyle { content in
                            content
                                .background(.yellow.opacity(0.1))
                      
                        }
                        .onAppear(perform: {
                            
                            let Queue1: DispatchQueue = DispatchQueue(label: "Queue1", attributes: .concurrent)
                            
                            for  index in 0..<taipei_weather_data.count{
                                Queue1.asyncAfter(deadline: .now()+Double(index)*0.25 ){
                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)) {
                                        taipei_weather_data[index].animate_bool = true
                                    }
                                    
                                }
                            }
                            

                        })
                        .padding(25)
                    }
                    .frame(width: .infinity, height: 450)
                    
                    GroupBox("Charts- Bar Chart 2"){

                        Chart(chart_data,id: \.city_name){ chartdata in
                            ForEach(chartdata.data) {
                                BarMark(
                                    x: .value("Month", $0.date),
                                    y: .value("Temperature", $0.temperature)
                                )
                                .foregroundStyle(by: .value("City", chartdata.city_name))
                                .position(by: .value("City", chartdata.city_name),axis: .horizontal,span:10)
                            }

                            RuleMark(
                                 y: .value("average temperature", 25)
                            )
                            .foregroundStyle(.red.opacity(0.5))
                        }

                        .chartXAxis{
                            AxisMarks(values: .stride(by: .month)){ value in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(.defaultDigits))
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position:.leading)
                            { value in
                                AxisGridLine().font(.system(size: 40,weight: Font.Weight.bold))
                                AxisValueLabel()
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartXAxisLabel(  "Month", position:  .automatic,
                                           alignment: Alignment.center,
                                           spacing: CGFloat(2))
                        .chartYScale(domain: 0...75)
                        .chartPlotStyle { content in
                            content
                                .background(.yellow.opacity(0.1))

                        }
                        .padding(25)
                    }
                    .frame(width: .infinity, height: 500)

                    GroupBox("Charts- Bar Chart 3"){

                        Chart(chart_data,id: \.city_name){ chartdata in
                            ForEach(chartdata.data) {
                                BarMark(
                                    x: .value("Month", $0.date),
                                    y: .value("Temperature", $0.temperature)
                                )
                                .foregroundStyle(by: .value("City", chartdata.city_name))
                            }

                            RuleMark(
                                 y: .value("average temperature", 25)
                            )
                            .foregroundStyle(.red.opacity(0.5))
                        }

                        .chartXAxis{
                            AxisMarks(values: .stride(by: .month)){ value in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(.defaultDigits))
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position:.leading)
                            { value in
                                AxisGridLine().font(.system(size: 40,weight: Font.Weight.bold))
                                AxisValueLabel()
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartXAxisLabel(  "Month", position:  .automatic,
                                           alignment: Alignment.center,
                                           spacing: CGFloat(2))
                        .chartYScale(domain: 0...75)
                        .chartPlotStyle { content in
                            content
                                .background(.yellow.opacity(0.1))

                        }
                        .padding(25)
                    }
                    .frame(width: .infinity, height: 500)

                    GroupBox("Charts- Points Chart"){
                        Chart{
                            ForEach(chart_data,id: \.city_name) { chartdata in
                                ForEach(chartdata.data) { data in
                                    PointMark(x: .value("Month", data.date), y: .value("Temperature", data.temperature))

                                }
                                .foregroundStyle(by: .value("City", chartdata.city_name))
                                .symbol(by: .value("City", chartdata.city_name))
                                .symbolSize(90)
                            }
                            RuleMark(
                                 y: .value("average temperature", 25)
                            )
                            .foregroundStyle(.red.opacity(0.5))


                        }
                        .chartXAxis{
                            AxisMarks( values: .stride(by: .month)){ value in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(.defaultDigits))
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position:.leading){ value in
                                AxisGridLine().font(.system(size: 40,weight: Font.Weight.bold))
                                AxisValueLabel()
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYScale(domain: 0...40)

                        .chartPlotStyle { content in
                            content
                                .background(.yellow.opacity(0.1))

                        }
                        .padding(25)
                    }
                    .frame(width: .infinity, height: 450)

                    GroupBox("Charts- Retangle Chart"){
                        Chart{
                            ForEach(chart_data,id: \.city_name) { chartdata in
                                ForEach(chartdata.data) { data in
                                    RectangleMark(x: .value("Month", data.date), y: .value("Temperature", data.temperature))

                                }
                                .foregroundStyle(by: .value("City", chartdata.city_name))
                                .symbol(by: .value("City", chartdata.city_name))
                                .symbolSize(90)
                            }
                            RuleMark(
                                 y: .value("average temperature", 25)
                            )
                            .foregroundStyle(.red.opacity(0.5))


                        }
                        .chartXAxis{
                            AxisMarks( values: .stride(by: .month)){ value in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(.defaultDigits))
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position:.leading){ value in
                                AxisGridLine().font(.system(size: 40,weight: Font.Weight.bold))
                                AxisValueLabel()
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYScale(domain: 0...40)

                        .chartPlotStyle { content in
                            content
                                .background(.yellow.opacity(0.1))

                        }
                        .padding(25)
                    }
                    .frame(width: .infinity, height: 450)

                    GroupBox("Charts- Area Chart"){
                        Chart{
                            ForEach(chart_data,id: \.city_name) { chartdata in
                                ForEach(chartdata.data) { data in
                                    AreaMark(x: .value("Month", data.date), y: .value("Temperature", data.temperature))

                                }
                                .foregroundStyle(by: .value("City", chartdata.city_name))
                                .symbol(by: .value("City", chartdata.city_name))
                                .symbolSize(90)
                            }
                            RuleMark(
                                 y: .value("average temperature", 25)
                            )
                            .foregroundStyle(.red.opacity(0.5))


                        }
                        .chartXAxis{
                            AxisMarks( values: .stride(by: .month)){ value in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(.defaultDigits))
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position:.leading){ value in
                                AxisGridLine().font(.system(size: 40,weight: Font.Weight.bold))
                                AxisValueLabel()
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYScale(domain: 0...75)
                        .chartPlotStyle { content in
                            content
                                .background(.yellow.opacity(0.1))

                        }
                        .padding(25)
                    }
                    .frame(width: .infinity, height: 450)

                    GroupBox("Charts- Line Chart  &  Point Chart"){
                        Chart{
                            ForEach(chart_data,id: \.city_name) { chartdata in
                                ForEach(chartdata.data) { data in
                                    LineMark(x: .value("Month", data.date), y: .value("Temperature", data.temperature))

                                }
                                .foregroundStyle(by: .value("City", chartdata.city_name))
                                .symbol(by: .value("City", chartdata.city_name))
                                .symbolSize(60)

                            }

                            ForEach(Yilan_weather_data) { data in
                                    PointMark(x: .value("Month", data.date), y: .value("Temperature", data.temperature))
                            }
                            .foregroundStyle(.pink)
                            .foregroundStyle(by: .value("City", "Yilan"))
                            .symbol(by: .value("City", "Yilan"))

                            RuleMark(
                                 y: .value("average temperature", 25)
                            )
                            .foregroundStyle(.red.opacity(0.5))


                        }

                        .chartXAxis{
                            AxisMarks( values: .stride(by: .month)){ value in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(.defaultDigits))
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position:.leading){ value in
                                AxisGridLine().font(.system(size: 40,weight: Font.Weight.bold))
                                AxisValueLabel()
                                    .font(.system(size: 18,weight: Font.Weight.bold))
                            }
                        }
                        .chartYScale(domain: 0...40)
                        .chartPlotStyle { content in
                            content
                                .background(.yellow.opacity(0.1))

                        }
                        .padding(25)
                    }
                    .frame(width: .infinity, height: 450)
                }
      
            }
            .onAppear {
                
                chart_data =    [
                    chartdata(city_name: "Taipei", data: taipei_weather_data)
                    ,chartdata(city_name: "NewTaipei", data: newtaipei_weather_data)
                ]
            }
        } else {
            // Fallback on earlier versions
        }
 
    }
}


struct SwiftUIView_21_officanal_chart_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_21_officanal_chart()
    }
}




struct weather:Identifiable{
    var id = UUID()
    var temperature: Double
    var date:Date
    var animate_bool:Bool = false
    
    init(temperature: Double, year: Int, month: Int, day: Int) {
      
        self.temperature = temperature
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
    }
}

struct chartdata{
    var city_name: String
    var data: [weather]
    
    init(city_name: String, data: [weather]) {
        self.city_name = city_name
        self.data = data
    }
    
}
