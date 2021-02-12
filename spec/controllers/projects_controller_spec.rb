require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
    describe '#new' do
        it 'render the new template' do
            get(:new)
            expect(response).to(render_template(:new)) 
        end
        it 'sets an instance variable with new job posts' do
            get(:new)
            expect(assigns(:project)).to(be_a_new(Project))
        end 
    end
    describe '#create' do
        context 'with user signed in' do
            before do
                user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
                request.session[:user_id] = user.id
            end
            context " with valid parameter " do 
                def valid_request
                    post(:create, params:{project: FactoryBot.attributes_for(:project)})
                end
                it 'creates a job post in the database' do
                    count_before = Project.count
                    valid_request
                    count_after=Project.count
                    expect(count_after).to(eq(count_before + 1))
                end
                it 'redirects us to a show page of that post' do
                    valid_request
                    project=Project.last
                    expect(response).to(redirect_to(project_url(project.id)))
                end
            end
            context 'with invalid parameters' do
                def invalid_request
                    post(:create, params:{project: FactoryBot.attributes_for(:project, title: nil)})
                end
                it 'doesnot save a record in the database'do
                    count_before = Project.count
                    invalid_request
                    count_after = Project.count
                    expect(count_after).to(eq(count_before))
                end
                it 'renders the new template' do
                    invalid_request
                    expect(response).to render_template(:new)
                end
            end
        end
    end
    describe '#show' do
        before do
            user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
            request.session[:user_id] = user.id
        end
        it 'render show template' do
            post(:create, params:{project: FactoryBot.attributes_for(:project)})
            project=Project.last
            get(:show, params:{id: project.id})
            expect(response).to render_template(:show)
        end
        it 'set an instance variable @project for the shown object' do
            post(:create, params:{project: FactoryBot.attributes_for(:project)})
            project=Project.last
            get(:show, params:{id: project.id})
            expect(assigns(:project)).to(eq(project))
        end
    end
    describe '#index' do 
        before do
            user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
            request.session[:user_id] = user.id
        end
        it 'render the index template' do
            get(:index)
            expect(response).to render_template(:index)
        end
        it 'assign an instance variable @projects which contains all created job posts' do
            post(:create, params:{project: FactoryBot.attributes_for(:project)})
            project_1 = FactoryBot.create(:project)
            project_1=Project.last
            post(:create, params:{project: FactoryBot.attributes_for(:project)})
            project_2=Project.last
            post(:create, params:{project: FactoryBot.attributes_for(:project)})
            project_3=Project.last
            get(:index)
            expect(assigns(:projects)).to eq([project_3, project_2,project_1])
        end
    end
    describe "# edit" do
        before do
            user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
            request.session[:user_id] = user.id
        end
        it "render the edit template" do
            post(:create, params:{project: FactoryBot.attributes_for(:project)})
            project=Project.last
            get(:edit, params:{id: project.id})
            expect(response).to render_template :edit
        end
    end
    describe '#update' do
        before do 
            user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
            request.session[:user_id] = user.id
        end
        context "with valid parameters" do
            it "update the job post record with new attributes" do
                post(:create, params:{project: FactoryBot.attributes_for(:project)})
                @project = Project.last
                new_title = "#{@project.title} plus some changes!!!"
                patch(:update, params:{id: @project.id, project: {title: new_title}})
                expect(@project.reload.title).to(eq(new_title))
            end
            it 'redirect to the show page' do
                post(:create, params:{project: FactoryBot.attributes_for(:project)})
                @project = Project.last
                new_title = "#{@project.title} plus some changes!!!"
                patch(:update, params:{id: @project.id, project: {title: new_title}})
                expect(response).to redirect_to(@project)
            end
        end
        context "with invalid parameters" do
            it 'should not update the job post record' do
                post(:create, params:{project: FactoryBot.attributes_for(:project)})
                @project = Project.last
                patch(:update, params:{id: @project.id, project: {title: nil}})
                project_after_update = Project.find(@project.id)
                expect(project_after_update.title).to(eq(@project.title))
            end
        end
    end
    describe '#destroy' do
        before do
            user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
            request.session[:user_id] = user.id
            post(:create, params:{project: FactoryBot.attributes_for(:project)})
            @project = Project.last
            delete(:destroy, params:{id: @project.id})
        end
        it 'remove job post from the database' do
            expect(Project.find_by(id: @project.id)).to(be(nil))
        end
        it 'redirect to the job post index' do
            expect(response).to redirect_to(projects_path)
        end
        it 'set a flash message' do
            expect(flash[:danger]).to be
        end
    end
end
