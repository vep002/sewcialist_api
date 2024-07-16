# Create an admin user
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Admin User',
  role: 1,
  jti: SecureRandom.uuid
)

# Create three projects for the admin user
not_started_project = Project.create!(
  title: 'Not Yet Started Project',
  description: 'This project has not been started yet.',
  status: 0,
  user: admin
)

in_progress_project = Project.create!(
  title: 'In Progress Project',
  description: 'This project is currently in progress.',
  status: 1,
  user: admin
)

completed_project = Project.create!(
  title: 'Completed Project',
  description: 'This project has been completed.',
  status: 2,
  user: admin
)

# Create five materials for the admin user
materials = [
  { name: 'Yarn', quantity: 10, description: 'Wool yarn', in_inventory: true },
  { name: 'Fabric', quantity: 5, description: 'Cotton fabric', in_inventory: true },
  { name: 'Needles', quantity: 20, description: 'Knitting needles', in_inventory: true },
  { name: 'Thread', quantity: 15, description: 'Sewing thread', in_inventory: true },
  { name: 'Buttons', quantity: 50, description: 'Assorted buttons', in_inventory: true }
]

materials.each do |material|
  Material.create!(material.merge(user: admin))
end

# Create four steps for the in-progress project
steps = [
  { description: 'Step 1: Gather materials', start_date: '2024-01-01', end_date: '2024-01-05', completed: true, project: in_progress_project },
  { description: 'Step 2: Start crafting', start_date: '2024-01-06', end_date: '2024-01-10', completed: false, project: in_progress_project },
  { description: 'Step 3: Midway check', start_date: '2024-01-11', end_date: '2024-01-15', completed: false, project: in_progress_project },
  { description: 'Step 4: Finishing touches', start_date: '2024-01-16', end_date: '2024-01-20', completed: false, project: in_progress_project }
]

steps.each do |step|
  Step.create!(step)
end

puts "Seed data created successfully!"
