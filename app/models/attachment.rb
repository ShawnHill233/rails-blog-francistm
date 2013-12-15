class Attachment < ActiveRecord::Base
  attr_accessible :file, :file_key, :user_id

  belongs_to :user

  validates :file_key, presence: true
  validates :file_key, uniqueness: { case_sensitive: false }
  validates :user, associated: true, presence: true

  def file
    @file
  end

  def file=(file)
    @file = file
  end

  def to_url
    "#{Settings.qiniu[:share_link]}/#{self.file_key}"
  end

  # 在查询之后记录原始文件
  # 为七牛远程修改文件名提供源文件名属性
  after_find do
    @origin_file_key = self.file_key
  end

  # 在更新AR之前，更新远程文件
  before_update do
    Qiniu::RS.move Settings.qiniu[:bucket_name], @origin_file_key,
                   Settings.qiniu[:bucket_name], self.file_key
  end

  # 在删除AR之前，先删除远程文件
  before_destroy do
    Qiniu::RS.delete Settings.qiniu[:bucket_name], self.file_key
  end

  # 创建之前，先上传远程文件
  # 如果上传到七牛服务器失败，则不不保存当前AR
  before_create do
    Qiniu::RS.upload_file key: self.file_key,
                          file: self.file.path,
                          uptoken: upload_token,
                          bucket: Settings.qiniu[:bucket_name]
  end

  private

  # 更具当前的空间名和时间生成上传Token
  def upload_token 
    Qiniu::RS.generate_upload_token scope: Settings.qiniu[:bucket_name]
  end
end
