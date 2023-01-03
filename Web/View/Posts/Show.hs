module Web.View.Posts.Show where
import Web.View.Prelude
import qualified Text.MMark as Mark

data ShowView = ShowView { post :: Include "comments" Post }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>{post.title}</h1>
        <p>Created: {post.createdAt |> timeAgo}</p>
        <p>{post.body |> renderMarkdown}</p>
        <section style="border: 1px solid #eee">
            <h5>comments</h5>
            <div>{forEach post.comments renderComment}</div>
            <a href={NewCommentAction post.id}>Add Comment</a>
        </section>
    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Posts" PostsAction
                            , breadcrumbText "Show Post"
                            ]

                        
renderMarkdown text = 
    case text |> Mark.parse "" of 
        Left error -> "no" -- ("Markdown parse error" ++ (show error) ++ text)
        Right md -> Mark.render md |> tshow |> preEscapedToHtml

renderComment comment = [hsx|
        <div class="mt-4">
            <h5>{comment.author}</h5>
            <p>{comment.body}</p>
        </div>
    |]