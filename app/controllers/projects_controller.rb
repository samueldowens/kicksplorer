class ProjectsController < ApplicationController

  def index
    @project = Project.new
  end

  def search
    @project = Project.where(category: params["project"]["category"]).shuffle.first

    render partial: 'kicksplore'

    # redirect_to kicksplore_path(@project)
  end

  def kicksplore
    @project = Project.find(params["format"])
  end

end
