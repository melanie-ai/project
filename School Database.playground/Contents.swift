import UIKit

struct Student{
    var name: String
    var favoriteTeacherID: Int
}

struct Teacher{
    var name: String
    var ID: Int
    var email: String?
    var hairColor: String?
}

struct School{
    var name: String
    var Teachers: [Teacher]

    func getTeacher(withID id: Int) -> Teacher? {
        for t in Teachers{
            if t.ID == id{
                return t
            }
        }
        return nil
    }
    
    func printFavoriteTeacherInfo(for student: Student){
        guard let Teacher = getTeacher(withID: student.favoriteTeacherID) else{
            print("Error: Teacher with ID \(student.favoriteTeacherID) is not found in the school.")
            return
        }
        print("Favorite Teacher Information:")
        print("Name: \(Teacher.name)")
        if let hairColor = Teacher.hairColor {
            print("Hair Color: \(hairColor)")
        } else {
            print("Hair Color: Not available. BALDIE!!")
        }
        if let email = Teacher.email {
            print("Email: \(email)")
        } else {
            print("Email: No email account")
        }
    }
}
let teachers = [
    Teacher(name: "Mr. Smith", ID: 1, email: "smith@school.com", hairColor: nil),
    Teacher(name: "Ms. Johnson", ID: 2, email: nil, hairColor: "Blonde"),
    Teacher(name: "Ms. Antigua", ID: 3, email: "antigua@school.com", hairColor: "Brown")
]
let school = School(name: "STEM Innovation Academy of the Oranges", Teachers: teachers)
let student1 = Student(name: "Jonathan", favoriteTeacherID: 1) // Matches a Teacher in the School
let student2 = Student(name: "Pablo", favoriteTeacherID: 99)

school.printFavoriteTeacherInfo(for: student1)
school.printFavoriteTeacherInfo(for: student2)
