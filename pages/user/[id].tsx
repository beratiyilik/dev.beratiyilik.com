import NextLink from "next/link";
import { GetServerSideProps, NextPage } from "next";
import fetch from "node-fetch";
import ErrorPage from "next/error";

type User = {
    id: string;
    name: string;
    email: string;
};

const UserPage: NextPage<{ user: User }> = ({ user }) => {
    if (!user) return <ErrorPage statusCode={404} title="User not found!" />;

    return (
        <>
            <div>{user.name}</div>
            <NextLink href="/">
                <div>Go back home</div>
            </NextLink>
        </>
    );
};

export const getServerSideProps: GetServerSideProps = async ({
    params,
    res
}) => {
    try {
        const { id } = params as { id: string };
        const result = await fetch(`http://localhost:3000/api/user/${id}`);
        const user: User = await result.json() as User;

        return {
            props: { user }
        };
    } catch {
        res.statusCode = 404;
        return {
            props: {}
        };
    }
};

export default UserPage;