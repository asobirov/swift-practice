
// Picker

Picker("Select the student", selection: $selectedStudent) {
    ForEach(0..<students.count){
        Text(self.students[$0])
    }
}

//Inputs

TextField("Text", text: $some)

// V, H, ZStack

VStack(alignment: .leading, spacing: 1.0){
    Text("Hello, world123!")
    Text("Hello, world!")
}

HStack(){
    Text("Hello, world123!")
    Text("Hello, world!")
}

ZStack(alignment: .top){
    Color.red.edgesIgnoringSafeArea(.all) // Color frame
    Text("Hello, world123!")
    Text("Hello, world!")
}

// Gradients

LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .bottom)
RadialGradient(gradient: Gradient(colors: [.red, .black]), center: .center, startRadius: 20, endRadius: 200)
AngularGradient(gradient: Gradient(colors: [.red, .blue, .yellow, .gray, .green, .red]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)


// Buttons
Button(action: {
    print("Button was tapped")
}) {
    HStack(spacing: 10){
        Image(systemName: "pencil")
        Text("Edit")
    }
}

// Alerts
