require 'rspec'
require './Router.rb'
require './CommentsController.rb'
require './PostsController.rb'

RSpec.describe Router do
  context 'Posts' do
    it '#create and show post' do
      allow_any_instance_of(Router).to receive(:gets).and_return('1', 'q')
      allow_any_instance_of(Resource).to receive(:gets).and_return('post', 'q')
      allow_any_instance_of(PostsController).to receive(:gets).and_return('first post')
      expect(subject)
      expect do
        PostsController.new.create
      end.to output("Enter text of post: Your post: first post\nindex: 1 \n").to_stdout
    end

    it '#return post by id' do
      allow_any_instance_of(Router).to receive(:gets).and_return('1', 'q')
      allow_any_instance_of(Resource).to receive(:gets).and_return('post', 'get', 'show', 'q')
      allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 0)
      expect(subject)
      expect do
        PostsController.new.show
      end.to output("Enter index of post: Incorrect id\nid:0 \"\"\n").to_stdout
    end

    it '#update post by id' do
      allow_any_instance_of(Router).to receive(:gets).and_return('1', 'q')
      allow_any_instance_of(Resource).to receive(:gets).and_return('post', 'put', 'q')
      allow_any_instance_of(PostsController).to receive(:gets).and_return(1, 'updated post')
      expect(subject)
      expect do
        PostsController.new.update
      end.to output("Enter index of post: Old post \"\" enter new post id:1 \"updated post\"\n").to_stdout
    end

    it '#delete post by id' do
      allow_any_instance_of(Router).to receive(:gets).and_return('1', 'q')
      allow_any_instance_of(Resource).to receive(:gets).and_return('post', 'delete', 'q')
      allow_any_instance_of(PostsController).to receive(:gets).and_return(0)
      expect(subject)
      expect do
        PostsController.new.destroy
      end.to output("Enter index of post: Incorrect id\n").to_stdout
    end
  end

  context "Comments" do
    it '#create and show comment' do
      allow_any_instance_of(Router).to receive(:gets).and_return('2', 'q')
      allow_any_instance_of(Resource).to receive(:gets).and_return('post', 'q')
      allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment')
      expect(subject)
      expect do
        CommentsController.new.create
      end.to output("Enter text of comment: Your comment: first comment\nindex: 1 \n").to_stdout
    end

    it '#return comment by id' do
      allow_any_instance_of(Router).to receive(:gets).and_return('2', 'q')
      allow_any_instance_of(Resource).to receive(:gets).and_return('post', 'get', 'show', 'q')
      allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 0)
      expect(subject)
      expect do
        CommentsController.new.show
      end.to output("Enter index of comment: Incorrect id\nid:0 \"\"\n").to_stdout
    end

    it '#update comment by id' do
      allow_any_instance_of(Router).to receive(:gets).and_return('2', 'q')
      allow_any_instance_of(Resource).to receive(:gets).and_return('post', 'put', 'q')
      allow_any_instance_of(CommentsController).to receive(:gets).and_return(1, 'updated comment')
      expect(subject)
      expect do
        CommentsController.new.update
      end.to output("Enter index of comment: Old comment \"\" enter new comment id:1 \"updated comment\"\n").to_stdout
    end

    it '#delete comment by id' do
      allow_any_instance_of(Router).to receive(:gets).and_return('1', 'q')
      allow_any_instance_of(Resource).to receive(:gets).and_return('post', 'delete', 'q')
      allow_any_instance_of(CommentsController).to receive(:gets).and_return(0)
      expect(subject)
      expect do
        CommentsController.new.destroy
      end.to output("Enter index of comment: Incorrect id\n").to_stdout
    end
  end
end
