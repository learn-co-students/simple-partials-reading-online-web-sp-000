class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

=begin
#edit and new html erb files
<%= form_for @student do |f|%>
 <%= render 'form' %>
<% end %>
Also, spec file needed to be changed due to update in .between method
  
=end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end