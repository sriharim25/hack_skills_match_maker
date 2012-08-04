# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  ph_no      :string(255)
#  skill1     :string(255)
#  skill2     :string(255)
#  skill3     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :ph_no, :skill1, :skill2, :skill3

  # Returns the percentage of skills covered.
  def skillCoverage(project)
    covered = 0
    if project.person1 != nil
      covered += 1
    end
    if project.person2 != nil
      covered += 1
    end
    if project.person3 != nil
      covered += 1
    end

    return covered / 3.0
  end

  # Returns the project with the lowest percentage
  # of skills obtained.
  def worst(projects)
    lowPercent = 1
    lowProject = nil
    projects.each do |project|
      percent = skillCoverage(project)
      if percent < lowPercent
        lowProject = project
      end
    end
    return lowProject
  end

  # Returns projects that require skill and do not yet have a filling.
  def projectsWithFree(skill)
    ret = Projects.all.select { |project| project.skill1 == skill
                                          or project.skill2 == skill
                                          or project.skill3 == skill}  
    ret = ret.select { |project|
      if project.skill1 == skill
        return project.person1 == nil
      elsif project.skill2 == skill
        return project.person2 == nil
      else
        return project.person3 == nil
      end
    }
    return ret
  end

  def getProject
    usedSkill = skill1
    companies = projectsWithFree(skill1)
    if companies.empty?
      usedSkill = skill1
      companies = projectsWithFree(skill2)
      if companies.empty?
        usedSkill = skill1
        companies = projectsWithFree(skill3)
        if companies.empty?
            puts 'Shit'
            return nil
        end
      end
    end
    selected = worst(companies)

    # Assign person to project
    if usedSkill == skill1
      selected.person1 = ph_no
    elsif usefSkill == skill2
      selected.person2 = ph_no
    else
      selected.person3 = ph_no
    end

    return selected
  end
end
