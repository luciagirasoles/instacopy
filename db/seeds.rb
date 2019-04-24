Comment.delete_all
Like.delete_all
Medium.delete_all
Post.delete_all
User.delete_all

salvauser = User.create(
  first_name: 'Salva',
  last_name: 'Xalambrí',
  birthday: '02-08-2018',
  private_email: true,
  email: 'salva@xalambri.com'
)

sergiouser = User.create(
  first_name: 'Sergio',
  last_name: 'Xalambrí',
  birthday: '02-08-1992',
  private_email: true,
  email: 'sergio@xalambri.com'
)

kattyauser = User.create(
  first_name: 'Kattya',
  last_name: 'Cuevas',
  birthday: '07-12-1994',
  private_email: true,
  email: 'kattya@cuevas.com'
)

sergiouser.follow(salvauser)
kattyauser.follow(salvauser)
kattyauser.follow(sergiouser)

salvamedium1 = Medium.create(name: 'image.jpg')
salvapost1 = salvauser.publish('my first post', salvamedium1)
sergiouser.like(salvapost1)
kattyauser.like(salvapost1)
sergiouser.comment('Cute!', salvapost1)


salvamedium2 = Medium.create(name: 'video.mp4')
salvapost2 = salvauser.publish('my second post', salvamedium2)
sergiouser.like(salvapost2)
sergiouser.comment('Cute!!!', salvapost2)

sergiomedium1 = Medium.create(name: 'image1.jpg')
sergiomedium2 = Medium.create(name: 'image2.jpg')
sergiopost1 = sergiouser.publish('my first post', sergiomedium1, sergiomedium2)
salvauser.like(sergiopost1)