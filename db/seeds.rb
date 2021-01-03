chewbacca = User.create(username: "Chewbacca", password: "password")
chewbacca.clients.create(name: "Kevin", age: 33, gender: "male", weight: 189)
chewbacca.clients.create(name: "Ben", age: 31, gender: "male", weight: 185)
chewbacca.clients.create(name: "Finn", age: 36, gender: "male", weight: 176)

yoda = User.create(username: "Yoda", password: "password")
yoda.clients.create(name: "Ren", age: 30, gender: "male", weight: 165)
yoda.clients.create(name: "Grogu", age: 25, gender: "male", weight: 159)
yoda.clients.create(name: "Jenny", age: 33, gender: "female", weight: 139)

skywalker = User.create(username: "Skywalker", password: "password")
skywalker.clients.create(name: "Leia", age: 33, gender: "female", weight: 143)
skywalker.clients.create(name: "Jeff", age: 32, gender: "male", weight: 192)
skywalker.clients.create(name: "Anakin", age: 36, gender: "male", weight: 183)


