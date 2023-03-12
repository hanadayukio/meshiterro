class PostImageController < ApplicationController
    
    # new.html.erbより投稿データを@post_imageへ
    def new
        @post_image = PostImage.new
    end
    
    # 投稿データの保存
    def create
        # 投稿データをPostImageモデルに紐付け
        @post_image = PostImage.new(post_image_params)
        # current_user(ヘルパーメソッド)現在ログイン中のユーザーに関する情報の取得
        @post_image.user_id = current_user.id
        @post_image.save
        redirect_to post_image_path
    end
    
    def index
    end
    
    def show
    end
    
    def destroy
    end
    
    # 投稿データのストロングパラメータ
    private
    
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
    
end
