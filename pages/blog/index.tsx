import { NextPage, GetStaticProps } from "next";
import NextLink from "next/link";

const BlogIndexPage: NextPage<{
    blogs: {
        slug: string;
        title: string;
        text: string;
    }[];
}> = ({ blogs }) => {
    return (
        <>
            {blogs.map((blog) => {
                return (
                    <>
                        <NextLink
                            as={`/blog/${blog.slug}`}
                            href={`/blog/[slug]`}
                            passHref
                            key={`/blog/${blog.slug}`}
                        >
                            {blog.title}
                        </NextLink>
                        <br />
                    </>
                );
            })}
        </>
    );
};

export const getStaticProps: GetStaticProps = async () => {
    const blogs = (await import("../../lib/blogs.json")).default;
    return {
        props: { blogs }
    };
};

export default BlogIndexPage;
