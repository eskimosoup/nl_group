# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Basic Life Support", "Epilepsy", "Fire Safety", "Handling Medication", "Health and Safety", "Information Governance",
"Training for Workers in a Lone Environment", "Safeguarding Vulnerable Adults (SOVA) and Child Protection (SOCA) Level 1",
"Safeguarding Vulnerable Adults (SOVA) and Child Protection (SOCA) Level 2", "Safeguarding Vulnerable Adults (SOVA) and Child Protection (SOCA) Level 3",
"Mental Capacity Act 2005", "COSHH (Control of Substances Hazardous to Health regulation)", "Equality, Diversity & Inclusion",
"Food Hygiene", "Handling Violence & Aggression and Complaint Handling", "Infection Control", "Manual Handling",
"RIDDOR (Reporting of Injuries, Diseases & Dangerous Occurrences Regulations)"].each do |mandatory_training_course|
  MandatoryTrainingCourse.find_or_create_by(name: mandatory_training_course)
end