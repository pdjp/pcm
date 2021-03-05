class PantsController < ApplicationController
  def index
    @pants = Pant.all
  end
  def show
    @pant = Pant.find_by(id: params[:id])
  end
  def new
    @pant = Pant.new
  end
  def create
    @pant = Pant.new(
      content: params[:content],
      color: params[:color],
      size: params[:size],
      image: "default_pants.jpg"
    )
    if @pant.save
      flash[:notice] = "作成しました"
      redirect_to("/pants/index")
    else
      render("pants/new")
    end
  end
  def edit
    @pant = Pant.find_by(id:params[:id])
  end
  def update
    @pant = Pant.find_by(id: params[:id])
    @pant.content = params[:content]
    @pant.color = params[:color]
    @pant.size = params[:size]
    if params[:image]
      @pant.image = "#{@pant.id}.jpg"
      image = params[:image]
      File.binwrite("public/pant_images/#{@pant.image}", image.read)
    end
    if @pant.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/pants/index")
    else
      render("pants/edit")
    end
  end
  def destroy
    @pant = Pant.find_by(id: params[:id])
    @pant.destroy
    flash[:notice] = "削除しました"
    redirect_to("/pants/index")
  end
end
