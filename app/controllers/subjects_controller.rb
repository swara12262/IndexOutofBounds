class SubjectsController < ApplicationController

def show
	@subjects = Subject.all

end

def index
	@subjects = Subject.all

end

end
