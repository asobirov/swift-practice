// Picker

Picker("Select the student", selection: $selectedStudent) {
    ForEach(0..<students.count){
        Text(self.students[$0])
    }
}

//Inputs

TextField("Text", text: $some)
