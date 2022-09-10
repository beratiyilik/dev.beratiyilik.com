import NextLink from "next/link";
import { GetStaticProps, GetStaticPaths, NextPage } from "next";

const BlogPage: NextPage<{
    title: string;
    text: string;
}> = ({ title, text }) => {
    return (
        <>
            <NextLink href="/blog" passHref>
                <div>Back to TOC</div>
            </NextLink>
            <div >
                {title}
            </div>
            <div>{text}</div>
        </>
    );
};

export const getStaticPaths: GetStaticPaths = async () => {
    const blogs = (await import("../../lib/blogs.json")).default;
    const slugs = blogs.map(blog => blog.slug);
    const paths = slugs.map(slug => ({ params: { slug } }));

    return {
        paths,
        fallback: false
    };
};

type Params = {
	params: {
		slug: string
	}
}

export async function getStaticProps({ params }: Params) {
    const blogs = (await import("../../lib/blogs.json")).default;
    const { slug } = params;
    const blog = blogs.find(x => x.slug === slug);

    return {
        props: {
            ...blog
        }
    };
}

export default BlogPage;