class ProjectsController < ApplicationController

  def index
    @project = Project.new
    @start = Project.all.shuffle.first
  end

  def kicksplore
    @project = Project.where(category: params["project"]["category"]).shuffle.first
    respond_to do |format|
      format.js
    end
  end

end
