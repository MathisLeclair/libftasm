/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/06/19 14:07:08 by mleclair          #+#    #+#             */
/*   Updated: 2018/06/19 14:08:28 by mleclair         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#

int main(){
    // ft_bzero
	strcpy(buf, "lol");
	dprintf(1, "\x1b[32mft_bzero:\x1b[0m\n\t%s [original]\n", buf);
	dprintf(1, "\t%03d %03d %03d %03d [original]\n", buf[0], buf[1], buf[2], buf[3]);
	ft_bzero(NULL, 42);
	dprintf(1, "\t%03d %03d %03d %03d (null)\n", buf[0], buf[1], buf[2], buf[3]);
	ft_bzero(buf, 0);
	dprintf(1, "\t%03d %03d %03d %03d (zero)\n", buf[0], buf[1], buf[2], buf[3]);
	ft_bzero(buf, 1);
	dprintf(1, "\t%03d %03d %03d %03d (one)\n", buf[0], buf[1], buf[2], buf[3]);
	ft_bzero(buf, 2);
	dprintf(1, "\t%03d %03d %03d %03d (two)\n", buf[0], buf[1], buf[2], buf[3]);
	ft_bzero(buf, 4);
	dprintf(1, "\t%03d %03d %03d %03d (four)\n", buf[0], buf[1], buf[2], buf[3]);
}